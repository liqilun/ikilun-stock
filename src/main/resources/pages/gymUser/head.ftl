<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid panel-heading">
            <ul class="nav pull-right">
                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user icon-white"></i>当前用户： ${gymUser.username}
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="updatepaasword.html">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="login.html">安全退出</a></li>
                    </ul>
                </li>
            </ul>
           <span style="font-size: 18px;color: #fff">${gym.name!}--鲸健身--后台管理</span>
            <!-- <ul class="nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">运营管理</a></li>
                <li><a href="#">数据分析</a></li>
            </ul> -->
        </div>
    </div>
</div>