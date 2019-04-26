<div class="panel panel-default">
    <div class="panel-heading">Received the following data:</div>
    <div class="panel-body">
        <ul class="list-group">
            <?php
            foreach ($_POST as $key => $value) {
                echo sprintf('<li class="list-group-item">%s=%s</li>', $key, $value);
            }
            ?>
        </ul>

    </div>
</div>
