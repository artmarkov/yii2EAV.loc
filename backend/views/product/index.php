<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
//echo '<pre>' . print_r($model, true) . '</pre>';
?>
<div class="site-index">

    <?= \mirocow\eav\admin\widgets\Fields::widget([
        'model' => $model,
        'categoryId' => $model->id,
        'entityName' => 'Продукт',
        'entityModel' => 'backend\models\Product', // ваша модель для которой подключено расширение
    ])?>

</div>