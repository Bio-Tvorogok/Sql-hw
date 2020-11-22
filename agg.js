print('ФИО: Кирдяшкин Игорь Вячеславович');
print('tags count: ', db.tags.count());
print('Adventure" tags count: ', db.tags.find({tag_name:"Adventure"}).count());
printjson(
        db.tags.aggregate([
                {"$group": {
                                _id: "$tag_name", 
                                tag_count: {$sum: 1}
                        }
                },
                {"$sort":{"tag_count": -1}},
                {$limit: 3}
        ])['_batch']
);