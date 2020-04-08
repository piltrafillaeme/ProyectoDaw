<aside class="main-sidebar sidebar-dark-primary elevation-4" style="overflow-x: hidden">
    <!-- Brand Logo -->
<a href="{{url('/')}}" class="brand-link">
<img src="{{url('/')}}/img/logo-jss.jpg" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Tartessos EF</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition"><div class="os-resize-observer-host observed"><div class="os-resize-observer" style="left: 0px; right: auto;"></div></div><div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;"><div class="os-resize-observer"></div></div><div class="os-content-glue" style="margin: 0px -8px; width: 249px; height: 559px;"></div><div class="os-padding"><div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;"><div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{url('/')}}/img/admin.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Jesús Sierra</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!--=====================================
            Botón Alumnas
            ======================================-->

            <li class="nav-item">
                <a href="{{ url("/profesorpaginas/listaalumnas") }}" class="nav-link">
                <i class="nav-icon fas fa-home"></i>
                <p>Listado Alumnas</p>
                </a>
            </li>
            
            <!--=====================================
            Botón Temas
            ======================================-->

            <li class="nav-item">
                <a href="{{ url("/administradores") }}" class="nav-link">
                <i class="nav-icon fas fa-users-cog"></i>
                <p>Temas</p>
                </a>
            </li>

            <!--=====================================
            Botón Cuestionarios
            ======================================-->

            <li class="nav-item">
                <a href="{{ url("/categorias") }}" class="nav-link">
                <i class="nav-icon fas fa-list-ul"></i>
                <p>Cuestionarios</p>
                </a>
            </li>

            <!--=====================================
            Botón Hábitos
            ======================================-->

            <li class="nav-item">
                <a href="{{ url("/articulos") }}" class="nav-link">
                <i class="nav-icon fas fa-sticky-note"></i>
                <p>Hábitos</p>
                </a>
            </li>

            <!--=====================================
            BOTÓN SITIO WEB
            ======================================-->

            <li class="nav-item">
            
            <a href="{{ substr(url("/"),0,-11) }}" class="nav-link" target="_blank">
                
                <i class="nav-icon fas fa-globe"></i>
                
                <p>Ver sitio</p>

            </a>

            </li>

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div></div></div><div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="height: 39.1335%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar-corner"></div></div>
    <!-- /.sidebar -->
  </aside>