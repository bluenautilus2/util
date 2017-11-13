
db.inventoryAllotmentChangeMessage.find({
   $and: [{ "inventory.0.roomId":"25301"},
          { "inventory.0.date":"2018-07-25"},
          { "inventory.0.flexInventory":"5"}]
});



//db.inventoryAllotmentChangeMessage.where("inventory.0.roomId").eq("25306")