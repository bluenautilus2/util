var startDate = "2018-04-01";
var endDate = "2019-12-31";
var hotelId = "228";

var roomNightCursor = db.roomNight.find({
 "hotel._id": hotelId,
 "_id.date": {
   "$gte": startDate,
   "$lte": endDate
 }
}, {
 "_id.date": 1,
 "hotel._id": 1,
 "roomCategoryName": 1,
 "ratePlans": 1
})
.sort({
 "_id.date": 1
})


while(roomNightCursor.hasNext()){
    var roomNightDocument = roomNightCursor.next();
    var roomNightRateArray = db.roomNightRate.find({
       "_id.roomCategoryId":roomNightDocument._id.roomCategoryId,
       "_id.date":roomNightDocument._id.date
    }).toArray();
    
    var ratePlanList = roomNightDocument.ratePlans;
    var seenIds = [ratePlanList.length];

    //find all rateplans in the RoomNight
    if(ratePlanList){
       ratePlanList.forEach(function(ratePlan){
           if(ratePlan.ratePlanId){
              seenIds.push(ratePlan.ratePlanId);
              var roomNightRateObject = getRoomNightRateFromArray(roomNightRateArray, ratePlan.ratePlanId);
              if(roomNightRateObject){
                 copyRates(ratePlan, roomNightRateObject)
              }
           }
       });
    }
    
    //find rates that didn't have inventory or restrictions
    if(roomNightRateArray){
        roomNightRateArray.forEach(function(roomNightRateObject){
            var rpId = roomNightRateObject._id.ratePlanId;
            if(seenIds.indexOf(rpId)==-1){
                print("found one left out")
                var blankRatePlan = new Object();
                copyRates(blankRatePlan, roomNightRateObject)
                roomNightDocument.ratePlans.push(blankRatePlan);
            }
        });
    }
    //printjson(roomNightDocument)
}

function copyRates(ratePlanObject, rateObject){
    if(ratePlanObject && rateObject && rateObject.rates){
       ratePlanObject.ratePlanId = rateObject._id.ratePlanId;
       ratePlanObject.minMarkUp = rateObject.rates.minMarkUp;
       ratePlanObject.markUp = rateObject.rates.markUp;
       ratePlanObject.rateSourceId = rateObject.rates.rateSourceId;
       ratePlanObject.currencyCode = rateObject.rates.currencyCode;
       ratePlanObject.baseByGuestAmts = rateObject.rates.baseByGuestAmts;
       ratePlanObject.extraPersons = rateObject.rates.getExtraPersons;
    }
}

function getRoomNightRateFromArray(roomNightRateList, ratePlanId){
    for(var i; i<roomNightRateList.length; i++){
        if(roomNightRateList[i].ratePlanId == ratePlanId){
            return roomNightRateList[i];
        }
    }
}

