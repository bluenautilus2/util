
//db.inventoryAllotmentChangeMessage.find({
 //  $and: [{ "inventories.0.roomId":"25383"},
 //         { "inventories.0.date":"2018-01-09"},
 //         { "inventories.0.flexInventory":"5"}]
//});

db.inventoryAllotmentChangeMessage.find({
     $and: [ { "inventories.roomId" : "25383" },
             { "inventories.date" : "2018-01-09"},
             {  "inventories.flexInventory":"5"},
             {}
      ]
});


//db.inventoryAllotmentChangeMessage.find({ "timestamp":"2017-11-13T09:09:23.985-08:00" });


//db.inventoryAllotmentChangeMessage.where("inventory.1.roomId").eq("25383")
//db.inventoryAllotmentChangeMessage.where("inventory.0.date").eq("2018-02-19")
