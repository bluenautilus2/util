
db.inventoryAllotmentChangeMessage.find({
   $and: [{ "inventory.0.roomId":"25306"},
          { "inventory.0.date":"2018-03-18"},
          { "inventory.0.flexInventory":"47"}]
});



//db.inventoryAllotmentChangeMessage.where("inventory.0.roomId").eq("25306")