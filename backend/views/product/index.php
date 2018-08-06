<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';

?>
<div class="site-index">

    <?= \mirocow\eav\admin\widgets\Fields::widget([
        'model' => $model,
        'categoryId' => $model->id,
        'entityName' => 'Продукт',
        'entityModel' => 'app\models\Product', // ваша модель для которой подключено расширение
    ])?>

</div>