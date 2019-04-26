<div class="panel panel-default">
    <div class="panel-heading">Add new Bond Movie</div>
    <div class="panel-body">
        <form class="form-inline" action="index.php" method="post">
            <div class="form-group">
                <label for="title-input">Title</label>
                <input type="title" class="form-control" name="title" id="title-input" placeholder="Title">
            </div>
            <div class="form-group">
                <label for="bond-input">Bond</label>
                <select class="form-control" name="bond" id="bond-input">
                    <option>Pierce Brosnan</option>
                    <option>Daniel Craig</option>
                    <option>Timothy Dalton</option>
                    <option>Roger Moore</option>
                    <option>Sean Connery</option>
                </select>
            </div>
            <input type="hidden" name="best-bond-ever" value="Daniel Craig">
            <button type="submit" class="btn btn-default">Save</button>
        </form>
    </div>
</div>