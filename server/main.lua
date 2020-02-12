ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'kfc', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'kfc', 'Alert kfc', true, true)
TriggerEvent('esx_society:registerSociety', 'kfc', 'kfc', 'society_kfc', 'society_kfc', 'society_kfc', {type = 'public'})



RegisterServerEvent('esx_kfcjob:getStockItem')
AddEventHandler('esx_kfcjob:getStockItem', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_kfcjob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_kfcjob:putStockItems')
AddEventHandler('esx_kfcjob:putStockItems', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_kfcjob:getFridgeStockItem')
AddEventHandler('esx_kfcjob:getFridgeStockItem', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_kfcjob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_kfcjob:putFridgeStockItems')
AddEventHandler('esx_kfcjob:putFridgeStockItems', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kfc_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_kfcjob:buyItem')
AddEventHandler('esx_kfcjob:buyItem', function(itemName, price, itemLabel)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kfc', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and (societyAccount.money >= price*10 or societyAccount.money >= price*(limit-qtty)) then
        if qtty < limit then
            if limit-qtty <10 then
              societyAccount.removeMoney(price*(limit-qtty))
              xPlayer.addInventoryItem(itemName, (limit-qtty))
              TriggerClientEvent('esx:showNotification', _source, _U('bought') ..(limit-qtty).."x ".. itemLabel)
            else
              societyAccount.removeMoney(price*10)
              xPlayer.addInventoryItem(itemName, 10)
              TriggerClientEvent('esx:showNotification', _source, _U('bought') .."10x ".. itemLabel)
            end
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_kfcjob:craftchickenwings')
AddEventHandler('esx_kfcjob:craftchickenwings', function(itemValue)
    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))
    CreateThread(function()  
      if _itemValue == 'chicken_wings' then
        SetTimeout(10000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            if xPlayer ~= nil then
              local alephQuantity     = xPlayer.getInventoryItem('chicken').count
              local gimelQuantity     = xPlayer.getInventoryItem('cheese').count

              if alephQuantity < 2 then
                  TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('bread') .. '~w~')
              elseif gimelQuantity < 2 then
                  TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('cheese') .. '~w~')
              else
                  local chanceToMiss = math.random(100)
                  if chanceToMiss <= Config.MissCraft then
                      TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                      xPlayer.removeInventoryItem('chicken', 1)
                      xPlayer.removeInventoryItem('cheese', 2)
                  else
                      TriggerClientEvent('esx:showNotification', _source, _U('craft') .. "Chicken Wing" .. ' ~w~!')
                      xPlayer.removeInventoryItem('chicken', 1)
                      xPlayer.removeInventoryItem('cheese', 2)
                      xPlayer.addInventoryItem('chicken_wings', 1)
                  end
              end
            else
              ESX.showNotification("~r~An error happened try to relog")
            end

        end)
      end
    end)
end)


ESX.RegisterServerCallback('esx_kfcjob:getVaultWeapons', function(source, cb)
  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kfc', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_kfcjob:addVaultWeapon', function(source, cb, weaponName)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kfc', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_kfcjob:removeVaultWeapon', function(source, cb, weaponName)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kfc', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_kfcjob:getPlayerInventory', function(source, cb)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
