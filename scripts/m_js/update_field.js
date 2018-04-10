db.roomNight.update({ "lastModified":null}, {$currentDate:{"lastModified": {$type: "date"}}}, false, true)
