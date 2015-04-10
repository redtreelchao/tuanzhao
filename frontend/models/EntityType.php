<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rd_entity_type".
 *
 * @property integer $id
 * @property integer $name
 * @property string $key
 * @property integer $add_time
 */
class EntityType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rd_entity_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'key', 'add_time'], 'required'],
            [['name', 'add_time'], 'integer'],
            [['key'], 'string', 'max' => 10]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'key' => 'Key',
            'add_time' => 'Add Time',
        ];
    }
}
