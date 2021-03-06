{include file="$template/includes/flashmessage.tpl"}
<script type="text/javascript">
    $(document).ready(function() {
        $('#myInvoices')
            .DataTable({
                "responsive": true,
                "dom": '<"listtable"fit>pl',
                "lengthChange": false,
                "filter": false,
                "sort": true,
                "columnDefs": [{
                    "orderable": false,
                    "targets": [
                        0
                    ]
                }],
                "stateSave": true,
                "info": false
            });
            
            if($('#mySupport tr').length>2)
            {
        $('#mySupport')
            .DataTable({
                "responsive": true,
                "dom": '<"listtable"fit>pl',
                "lengthChange": false,
                "filter": false,
                "sort": true,
                "stateSave": true,
                "info": false
            });
        }
        $(
                '#myProjects')
            .DataTable({
                "responsive": true,
                "dom": '<"listtable"fit>pl',
                "lengthChange": false,
                "filter": false,
                "sort": true,
                "stateSave": true,
                "info": false
            });
        $(
                '#myBilling')
            .DataTable({
                "responsive": true,
                "dom": '<"listtable"fit>pl',
                "lengthChange": false,
                "filter": false,
                "sort": true,
                "stateSave": true,
                "info": false
            });
        $(
                '#myServices')
            .DataTable({
                "responsive": true,
                "dom": '<"listtable"fit>pl',
                "lengthChange": false,
                "filter": false,
                "sort": true,
                "stateSave": true,
                "info": false
            });
    });
</script>

<div class="My-dasboard">
    <!-- <div class="Dasboard-home">
        <div class="Dasboard">
            <span><img src="/templates/Armelin/assets/img/My-dasboard-icon.png"></span>
            <ul class="select">
                <li><a href="clientarea.php">My Dashboard</a></li>
                <li><a href="clientarea.php?action=invoices">My invoices</a></li>
                <li><a href="clientarea.php?action=products">My Plans &amp; services</a></li>
                <li><a href="supporttickets.php">My Projects</a></li>
                <li><a href="/Sandbox/index.php?rp=/user/profile">My Profile</a></li>
                <li><a href="/Sandbox/index.php?rp=/account/paymentmethods">My Payments</a></li>
            </ul>
        </div>
        <div class="home-dashboard">
            <div class="breadcrumbs">{include file="$template/includes/breadcrumb.tpl"}</div>
        </div>
    </div> -->
    <div class="clientarea-normal">
        <div class="box">
            <div class="span-box">
                <span class="fa__star"><i class="fas fa-star"></i></span>
                <a href="{$WEB_ROOT}/clientarea.php?action=services">
                    <span class="label">{$clientsstats.productsnumactive}</span>
                    <h4>PLANS & SERVICES<!-- {lang key='navservices'} --></h4>
                </a>
            </div>
        </div>
        <div class="box">
            <div class="span-box">
                <span class="fa__star"><i class="fas fa-star"></i></span>
                <a href="{$WEB_ROOT}/clientarea.php?action=invoices">
                    <span class="label">{$clientsstats.numunpaidinvoices}</span>
                    <h4>INVOICES DUE<!-- {lang key='navinvoices'} --></h4>
                </a>
            </div>
        </div>
        <div class="box">
            <div class="span-box">
                <span class="fa__star"><i class="fas fa-star"></i></span>
                <a href="{$WEB_ROOT}/clientarea.php?action=domains">
                    <span class="label">{$clientsstats.numactivedomains}</span>
                    <h4>{lang key='navdomains'}</h4>
                </a>
            </div>
        </div>
        <div class="box">
            <div class="span-box">
                <span class="fa__star"><i class="fas fa-star"></i></span>
                <a href="{$WEB_ROOT}/supporttickets.php">
                    <!-- <img src="/templates/Armelin/assets/img/Support-tickets-icon.png"> -->
                    <span class="label">{$clientsstats.numactivetickets}</span>
                    <h4>Open TICKETS<!-- {lang key='navtickets'} --></h4>
                </a>
            </div>
        </div>
    </div>
    <div class="Welcome-billing">
        <div class="Welcome-section">
            <div class="Welcome-title">
                <h2><img src="/templates/New-AM/img/bullhorn-icon.png">Welcome</h2>
            </div>
            <div class="Welcome-invoices equalheight">
                <div class="Equal-box">
                    <div class="section-left">
                        <div class="box">
                            <div class="Title">
                                <h2><img src="/templates/New-AM/img/Welcome-section-icon-1.png">Overdue invoices</h2>
                            </div>
                            <p>You have <b>{$clientsstats.numdueinvoices}</b> overdue invoice(s) with a total balance due of <b>{$clientsstats.dueinvoicesbalance}</b>. Pay them now to avoid any interruptions in service.</p>
                            <a href="clientarea.php?action=invoices" class="Play-btn">PAY ALL</a>
                        </div>
                    </div>
                    <div class="section-right">
                        <div class="box">
                            <div class="Title">
                                <h2><img src="/templates/New-AM/img/Welcome-section-icon-2.png">Account credit balance</h2>
                            </div>
                            <p>Balance: <span>{$clientsstats.creditbalance}</span></p>
                        </div>
                        <div class="box">
                            <div class="Title">
                                <h2><img src="/templates/New-AM/img/Welcome-section-icon-3.png">Attached account files</h2>
                            </div>
                            <p>No files available</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Welcome-info equalheight">
                <div class="Equal-box">
                    <div class="Title">
                        <h2>MY INFO</h2>
                    </div>
                    {if $clientsdetails.companyname}<span>{$clientsdetails.companyname}</span>{/if}
                        <p>{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                        {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                        {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                        {$clientsdetails.country}
                        {if $clientsdetails.tax_id}
                            <br />{$taxIdLabel}: {$clientsdetails.tax_id}
                        {/if}
                        {if $customfields}
                        <br /><br />
                        {foreach $customfields as $customfield}
                        {$customfield.fieldname}: {$customfield.value}<br />
                        {/foreach}
                    {/if}
                    </p>
                    <a href="clientarea.php?action=details" class="Update-btn">UPDATE</a>
                </div>
            </div>
        </div>
        <div class="Verificationbox"> {include file="$template/includes/validateuser.tpl"}
    {include file="$template/includes/verifyemail.tpl"}</div>
    
    
    <div class="grid grid-cols-1 gap-8 mb-10 xl:grid-cols-2 2xl:grid-cols-3">
    <div class="relative col-span-3 px-10 py-5 bg-white shadow-xl dark:bg-gray-900 rounded-tl-xl rounded-br-xl">
        {foreach $panels as $item}
            {if in_array($item->getName(), $flattern_enabled_panels) && $item->getName()=='pm-addon'}
                {include file="$template/includes/outputHomePanels_projects.tpl"}
            {/if}
            {if in_array($item->getName(),$flattern_enabled_panels) && $item->getName()=='Your Files'}
                {include file="$template/includes/outputHomePanels_files.tpl"}
            {/if}
        {/foreach}
    </div>
</div>


        <div class="billing-section">
            <div class="billing-title">
                <h2><img src="/templates/New-AM/img/Billing-icon.png">{$LANG.navbilling}</h2>
            </div>
            <!-- <div class="billing-table">
                <table id="table_id">
                    <thead>
                        <tr>
                            <th>Invoice #</th>
                            <th>Invoice Date</th>
                            <th>Due Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3816</td>
                            <td>7/8/2021</td>
                            <td>8/8/2021</td>
                            <td>$100.00</td>
                            <td><a href="#" class="table-btn Paid">PAID</a></td>
                            <td><a href="#" class="table-paynow">PAY NOW</a></td>
                        </tr>
                        <tr>
                            <td>3816</td>
                            <td>7/8/2021</td>
                            <td>8/8/2021</td>
                            <td>$100.00</td>
                            <td><a href="#" class="table-btn Refunded">REFUNDED</a></td>
                            <td><a href="#" class="table-paynow">PAY NOW</a></td>
                        </tr>
                        <tr>
                            <td>3816</td>
                            <td>7/8/2021</td>
                            <td>8/8/2021</td>
                            <td>$100.00</td>
                            <td><a href="#" class="table-btn Unpaid">UNPAID</a></td>
                            <td><a href="#" class="table-paynow">PAY NOW</a></td>
                        </tr>
                    </tbody>
                </table>
            </div> -->
            

            <div class="billing-Invoices">
                <!-- <div class="well">
                    <table class="table">
                        <tr>
                            <td><span class="glyphicon glyphicon-file"></span> {$LANG.statsdueinvoicesbalance}:</td>
                            <td><a href="clientarea.php?action=invoices">{$clientsstats.dueinvoicesbalance}</a>
                            </td>
                            <td><a class="My-invoices" href="clientarea.php?action=invoices" title="{$LANG.invoices}"><span class="glyphicon glyphicon-chevron-right pull-right flip"></span></a>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="glyphicon glyphicon-plus-sign"> </span> {$LANG.statscreditbalance}:</td>
                            <td><a href="clientarea.php?action=addfunds">{$clientsstats.creditbalance}</a>
                            </td>
                            <td><a class="My-invoices" href="clientarea.php?action=addfunds" title="{$LANG.addfunds}"><span class="glyphicon glyphicon-chevron-right pull-right flip"></span></a>
                            </td>
                        </tr>
                    </table>
                </div> -->
                <table class="min-w-full divide-y divide-gray-100 dark:divide-gray-900" id="myBilling">
                    <thead class="bg-transparent dark:bg-black">
                        <tr>
                            <th
                                class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                                Invoice #
                            </th>
                            <th class="px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase">
                                Invoice Date
                            </th>
                            
                            <th
                                class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase sm:table-cell">
                                Due Date
                            </th>
                            <th
                                class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                                Total
                            </th>
                            <th
                                class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                                Status
                            </th>
                            <th
                                class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                                
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-100 dark:divide-gray-900 dark:bg-transparent">
                        <tr>
                            <td class="hidden px-6 py-4 lg:table-cell"><p>3816</p></td>
                            <td class="px-6 py-4"><p>7/8/2021</p></td>
                            <td class="px-6 py-4"><p>8/8/2021</p></td>
                            <td class="px-6 py-4"><p>$100.00</p></td>
                            <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label Paid">PAID</span></p></td>
                            <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">PAY NOW</a></p></td>
                        </tr>
                        <tr>
                            <td class="hidden px-6 py-4 lg:table-cell"><p>3816</p></td>
                            <td class="px-6 py-4"><p>7/8/2021</p></td>
                            <td class="px-6 py-4"><p>8/8/2021</p></td>
                            <td class="px-6 py-4"><p>$100.00</p></td>
                            <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label Refunded">REFUNDED</span></p></td>
                            <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">PAY NOW</a></p></td>
                        </tr>
                        <tr>
                            <td class="hidden px-6 py-4 lg:table-cell"><p>3816</p></td>
                            <td class="px-6 py-4"><p>7/8/2021</p></td>
                            <td class="px-6 py-4"><p>8/8/2021</p></td>
                            <td class="px-6 py-4"><p>$100.00</p></td>
                            <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label Unpaid">UNPAID</span></p></td>
                            <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">PAY NOW</a></p></td>
                        </tr>                                               
                    </tbody>
                </table>
                <div class="Showing-section">
                    <div class="Showing-box">
                        <div class="Latest-invoices">
                            <p>SHOWING 3 LATEST INVOICES</p>
                        </div>
                        <div class="View-invoices">
                            <a href="clientarea.php?action=invoices">VIEW ALL INVOICES<img src="/templates/New-AM/img/View-invoices-arrow.png"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Account-quicklinks">
                <div class="Title">
                    <h2>ACCOUNT QUICKLINKS</h2>
                </div>
                <ul>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path d="M256 0v128h128L256 0zM288 256H96v64h192V256zM224 128L224 0H48C21.49 0 0 21.49 0 48v416C0 490.5 21.49 512 48 512h288c26.51 0 48-21.49 48-48V160h-127.1C238.3 160 224 145.7 224 128zM64 72C64 67.63 67.63 64 72 64h80C156.4 64 160 67.63 160 72v16C160 92.38 156.4 96 152 96h-80C67.63 96 64 92.38 64 88V72zM64 136C64 131.6 67.63 128 72 128h80C156.4 128 160 131.6 160 136v16C160 156.4 156.4 160 152 160h-80C67.63 160 64 156.4 64 152V136zM320 440c0 4.375-3.625 8-8 8h-80C227.6 448 224 444.4 224 440v-16c0-4.375 3.625-8 8-8h80c4.375 0 8 3.625 8 8V440zM320 240v96c0 8.875-7.125 16-16 16h-224C71.13 352 64 344.9 64 336v-96C64 231.1 71.13 224 80 224h224C312.9 224 320 231.1 320 240z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/clientarea.php?action=quotes">MY QUOTES</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><path d="M384 128h-128V0L384 128zM256 160H384v304c0 26.51-21.49 48-48 48h-288C21.49 512 0 490.5 0 464v-416C0 21.49 21.49 0 48 0H224l.0039 128C224 145.7 238.3 160 256 160zM64 88C64 92.38 67.63 96 72 96h80C156.4 96 160 92.38 160 88v-16C160 67.63 156.4 64 152 64h-80C67.63 64 64 67.63 64 72V88zM72 160h80C156.4 160 160 156.4 160 152v-16C160 131.6 156.4 128 152 128h-80C67.63 128 64 131.6 64 136v16C64 156.4 67.63 160 72 160zM197.5 316.8L191.1 315.2C168.3 308.2 168.8 304.1 169.6 300.5c1.375-7.812 16.59-9.719 30.27-7.625c5.594 .8438 11.73 2.812 17.59 4.844c10.39 3.594 21.83-1.938 25.45-12.34c3.625-10.44-1.891-21.84-12.33-25.47c-7.219-2.484-13.11-4.078-18.56-5.273V248c0-11.03-8.953-20-20-20s-20 8.969-20 20v5.992C149.6 258.8 133.8 272.8 130.2 293.7c-7.406 42.84 33.19 54.75 50.52 59.84l5.812 1.688c29.28 8.375 28.8 11.19 27.92 16.28c-1.375 7.812-16.59 9.75-30.31 7.625c-6.938-1.031-15.81-4.219-23.66-7.031l-4.469-1.625c-10.41-3.594-21.83 1.812-25.52 12.22c-3.672 10.41 1.781 21.84 12.2 25.53l4.266 1.5c7.758 2.789 16.38 5.59 25.06 7.512V424c0 11.03 8.953 20 20 20s20-8.969 20-20v-6.254c22.36-4.793 38.21-18.53 41.83-39.43C261.3 335 219.8 323.1 197.5 316.8z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/clientarea.php?action=invoices">INVOICES</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M320 336c0 8.844-7.156 16-16 16h-96C199.2 352 192 344.8 192 336V288H0v144C0 457.6 22.41 480 48 480h416c25.59 0 48-22.41 48-48V288h-192V336zM464 96H384V48C384 22.41 361.6 0 336 0h-160C150.4 0 128 22.41 128 48V96H48C22.41 96 0 118.4 0 144V256h512V144C512 118.4 489.6 96 464 96zM336 96h-160V48h160V96z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/index.php?m=project_management">MY PROJECTS</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M147.8 192H480V144C480 117.5 458.5 96 432 96h-160l-64-64h-160C21.49 32 0 53.49 0 80v328.4l90.54-181.1C101.4 205.6 123.4 192 147.8 192zM543.1 224H147.8C135.7 224 124.6 230.8 119.2 241.7L0 480h447.1c12.12 0 23.2-6.852 28.62-17.69l96-192C583.2 249 567.7 224 543.1 224z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/clientarea.php?action=services">MY PLANS<br> & SERVICES</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M512 32C547.3 32 576 60.65 576 96V128H0V96C0 60.65 28.65 32 64 32H512zM576 416C576 451.3 547.3 480 512 480H64C28.65 480 0 451.3 0 416V224H576V416zM112 352C103.2 352 96 359.2 96 368C96 376.8 103.2 384 112 384H176C184.8 384 192 376.8 192 368C192 359.2 184.8 352 176 352H112zM240 384H368C376.8 384 384 376.8 384 368C384 359.2 376.8 352 368 352H240C231.2 352 224 359.2 224 368C224 376.8 231.2 384 240 384z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/account/paymentmethods">PAYMENT<br> METHODS</a>
                    </li>
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M319.9 320c57.41 0 103.1-46.56 103.1-104c0-57.44-46.54-104-103.1-104c-57.41 0-103.1 46.56-103.1 104C215.9 273.4 262.5 320 319.9 320zM369.9 352H270.1C191.6 352 128 411.7 128 485.3C128 500.1 140.7 512 156.4 512h327.2C499.3 512 512 500.1 512 485.3C512 411.7 448.4 352 369.9 352zM512 160c44.18 0 80-35.82 80-80S556.2 0 512 0c-44.18 0-80 35.82-80 80S467.8 160 512 160zM183.9 216c0-5.449 .9824-10.63 1.609-15.91C174.6 194.1 162.6 192 149.9 192H88.08C39.44 192 0 233.8 0 285.3C0 295.6 7.887 304 17.62 304h199.5C196.7 280.2 183.9 249.7 183.9 216zM128 160c44.18 0 80-35.82 80-80S172.2 0 128 0C83.82 0 48 35.82 48 80S83.82 160 128 160zM551.9 192h-61.84c-12.8 0-24.88 3.037-35.86 8.24C454.8 205.5 455.8 210.6 455.8 216c0 33.71-12.78 64.21-33.16 88h199.7C632.1 304 640 295.6 640 285.3C640 233.8 600.6 192 551.9 192z"/></svg>
                        <a href="https://sandbox.accounts.armelin.media/account/users">AUTHORIZED<br> USERS</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</div>



<div class="Myticket-section">
    <div class="Myticket-box">
        <div class="Title">
            <h2><img src="/templates/New-AM/img/My-tickets-icon.png">MY TICKETS</h2>
        </div>
        <!-- <h3 class="page-header-2">
            <span aria-hidden="true" class="icon icon-support"></span><span
                class="text-lg header-text">{$clientsstats.numactivetickets}
                {$LANG.supportticketsopentickets|replace:'Open Support Tickets':'Tickets'}</span>
        </h3> -->
        <div class="New__ticket">
            <a href="submitticket.php?step=2&deptid=1"><img src="/templates/New-AM/img/New-ticket-icon.png">Open new ticket</a>
        </div>
        <table class="min-w-full divide-y divide-gray-100 dark:divide-gray-900" id="mySupport">
            <thead class="bg-transparent dark:bg-black">
                <tr>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        {$LANG.supportticketsdepartment}
                    </th>
                    <th class="px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase">
                        {$LANG.supportticketssubject}
                    </th>
                    
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase sm:table-cell">
                        {$LANG.supportticketsstatus}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        {$LANG.supportticketsticketlastupdated}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        <!-- {$LANG.supportticketsticketurgency} -->
                    </th>
                    
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100 dark:divide-gray-900 dark:bg-transparent">
                {foreach from=$tickets item=ticket}
                    {assign var="label" value="text-primary-600"}
                    {if $ticket.status|strstr:"779500"}{assign var="label" value="text-green-600"}
                    {elseif $ticket.status|strstr:"000000"}{assign var="label" value="text-black dark:text-white"}
                    {elseif $ticket.status|strstr:"888888"}{assign var="label" value="text-gray-600"}
                    {elseif $ticket.status|strstr:"ff6600"}{assign var="label" value="text-orange-600"}
                    {elseif $ticket.status|strstr:"224488"}{assign var="label" value="text-blue-600"}
                    {elseif $ticket.status|strstr:"cc0000"}{assign var="label" value="text-red-600"}
                    {/if}
                    <tr>
                        <td class="hidden px-6 py-4 lg:table-cell"><p>{$ticket.department}</p></td>
                        <td class="px-6 py-4"><p>
                            <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">#{$ticket.tid} <b>{$ticket.subject}</b></a>
                            <ul class="lg:hidden">
                                <li class="sm:hidden">
                                    <span class="pl-0 label {$label}">{$ticket.status|strip_tags:false}</span>
                                </li>
                                <li>{$LANG.supportticketsticketlastupdated}: {$ticket.lastreply}</li>
                                <li>{$LANG.supportticketsdepartment}: {$ticket.department}</li>
                                <li>{$LANG.supportticketsticketurgency}: {$ticket.urgency}</li>
                            </ul>
                            </p>
                        </td>
                        
                        <td class="hidden px-6 py-4 sm:table-cell">
                            <p><span class="label {$label} {$ticket.status|strip_tags:false} {$ticket.status|strip_tags:false}">{$ticket.status|strip_tags:false}</span></p>
                        </td>
                        <td class="hidden px-6 py-4 lg:table-cell"><p>{$ticket.lastreply}</p></td>
                        <td class="hidden px-6 py-4 lg:table-cell"><p><a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="open-btn">Open<img src="/templates/New-AM/img/open-arrow.png"></a><!-- {$ticket.urgency} --></p></td>
                        
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="5" class="norecords">
                            <div class="flex items-center">
                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" width="32" height="32"
                                    viewBox="0 0 32 32">
                                    <title>Folder-Hide</title>
                                    <path
                                        d="M31.333 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM31.333 10.845c-0.368 0-0.667-0.299-0.667-0.667v-0.845c0-0.115-0.005-0.229-0.016-0.344-0.031-0.367 0.243-0.692 0.609-0.72 0.372-0.033 0.691 0.241 0.72 0.609 0.015 0.151 0.020 0.301 0.020 0.455v0.845c0 0.368-0.3 0.667-0.667 0.667zM30.469 7.293c-0.208 0-0.415-0.097-0.544-0.279-0.205-0.291-0.451-0.552-0.725-0.777-0.285-0.233-0.328-0.653-0.095-0.939 0.235-0.285 0.653-0.327 0.94-0.095 0.365 0.301 0.693 0.649 0.967 1.035 0.213 0.3 0.143 0.716-0.155 0.929-0.119 0.085-0.256 0.125-0.388 0.125zM27.377 5.387c-0.033 0-0.068-0.003-0.101-0.008-0.199-0.029-0.401-0.045-0.609-0.045h-0.532c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h0.532c0.276 0 0.547 0.021 0.808 0.061 0.363 0.056 0.613 0.395 0.559 0.759-0.049 0.331-0.333 0.567-0.656 0.567zM23.645 5.333h-1.245c-0.367 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.245c0.367 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM19.913 5.333h-1.244c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.244c0.368 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM16.167 5.333h-0.667c-0.368 0-0.667-0.299-0.667-0.667 0-0.085-0.015-0.235-0.084-0.455-0.111-0.352 0.085-0.725 0.436-0.836s0.725 0.084 0.836 0.436c0.020 0.064 0.036 0.127 0.055 0.188h0.091c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 10.685c-0.368 0-0.667-0.299-0.667-0.667v-1.317c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.317c0 0.368-0.3 0.667-0.667 0.667zM0.667 6.732c-0.368 0-0.667-0.299-0.667-0.667v-0.983c0-0.131 0.004-0.26 0.016-0.389 0.029-0.367 0.341-0.639 0.72-0.611 0.367 0.031 0.64 0.352 0.611 0.72-0.009 0.093-0.013 0.187-0.013 0.28v0.983c0 0.369-0.3 0.667-0.667 0.667zM1.64 3c-0.141 0-0.284-0.045-0.405-0.139-0.292-0.224-0.347-0.643-0.123-0.935 0.312-0.405 0.672-0.76 1.072-1.052 0.299-0.217 0.715-0.152 0.932 0.143 0.217 0.299 0.153 0.716-0.144 0.933s-0.567 0.483-0.803 0.788c-0.132 0.172-0.329 0.261-0.529 0.261zM13.951 2.489c-0.165 0-0.329-0.060-0.459-0.183-0.293-0.277-0.6-0.5-0.912-0.663-0.327-0.169-0.452-0.572-0.283-0.899 0.171-0.327 0.571-0.453 0.899-0.284 0.423 0.22 0.832 0.515 1.215 0.879 0.268 0.252 0.279 0.676 0.025 0.943-0.131 0.136-0.307 0.207-0.485 0.207zM10.319 1.333h-1.319c-0.368 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.297 0.667-0.665 0.667zM6.365 1.333h-1.316c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.668 0.667zM0.667 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM6 32h-0.667c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h0.667c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM25.888 32h-1.325c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM21.911 32h-1.327c-0.367 0-0.667-0.3-0.667-0.667s0.3-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.299 0.667-0.667 0.667zM17.932 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM13.953 32h-1.324c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.668 0.667zM9.976 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM4.695 32c-0.44 0-0.823-0.048-1.192-0.14-0.357-0.088-0.573-0.453-0.483-0.808 0.091-0.359 0.453-0.573 0.809-0.483 0.395 0.1 0.867 0.109 1.107 0.092 0.387-0.007 0.685 0.253 0.711 0.62s-0.252 0.687-0.62 0.711c-0.109 0.004-0.221 0.008-0.332 0.008zM28.521 31.819c-0.284 0-0.547-0.184-0.636-0.471-0.112-0.351 0.084-0.725 0.437-0.835 0.349-0.111 0.68-0.277 0.977-0.499 0.299-0.219 0.713-0.156 0.931 0.14 0.219 0.296 0.156 0.713-0.139 0.932-0.417 0.307-0.881 0.543-1.373 0.696-0.065 0.027-0.133 0.036-0.197 0.036zM7.371 30.963c-0.181 0-0.361-0.073-0.493-0.217-0.248-0.272-0.228-0.693 0.044-0.943 0.273-0.249 0.501-0.539 0.677-0.861s0.581-0.443 0.904-0.268c0.324 0.176 0.444 0.581 0.268 0.904-0.248 0.456-0.567 0.863-0.951 1.213-0.127 0.115-0.289 0.172-0.449 0.172zM1.492 30.451c-0.2 0-0.397-0.088-0.528-0.26-0.317-0.412-0.561-0.869-0.725-1.361-0.116-0.351 0.073-0.727 0.423-0.843 0.349-0.115 0.727 0.073 0.843 0.421s0.289 0.673 0.516 0.969c0.224 0.292 0.171 0.709-0.121 0.933-0.121 0.096-0.265 0.14-0.407 0.14zM31.184 29.084c-0.061 0-0.121-0.009-0.184-0.027-0.355-0.1-0.56-0.469-0.459-0.823 0.081-0.292 0.123-0.593 0.123-0.901v-0.228c0-0.368 0.3-0.667 0.667-0.667 0.368 0 0.667 0.299 0.667 0.667v0.228c0 0.429-0.057 0.855-0.175 1.264-0.080 0.293-0.349 0.487-0.639 0.487zM8.667 27.353c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.3 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM0.667 26.657c-0.368 0-0.667-0.301-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.333 25.12c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM8.667 23.375c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.371-0.3 0.667-0.667 0.667zM0.667 22.681c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 21.14c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v1.325c0 0.371-0.3 0.667-0.667 0.667zM8.667 19.397c-0.368 0-0.667-0.299-0.667-0.667v-1.324c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.324c0 0.368-0.3 0.667-0.667 0.667zM0.667 18.703c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 17.164c-0.368 0-0.667-0.3-0.667-0.667v-1.325c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.325c0 0.367-0.3 0.667-0.667 0.667zM8.667 15.419c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.331 13.187c-0.359 0-0.653-0.283-0.667-0.64-0.013-0.369-0.087-0.731-0.221-1.076-0.135-0.343 0.036-0.729 0.38-0.863 0.341-0.132 0.729 0.037 0.863 0.381 0.189 0.484 0.292 0.992 0.311 1.509 0.013 0.368-0.276 0.677-0.641 0.691-0.008-0.003-0.016-0.003-0.024-0.003zM9.107 11.513c-0.103 0-0.207-0.024-0.305-0.075-0.329-0.168-0.457-0.571-0.287-0.897 0.236-0.459 0.545-0.873 0.919-1.233 0.263-0.255 0.687-0.248 0.943 0.019 0.255 0.265 0.247 0.687-0.019 0.943-0.269 0.257-0.491 0.556-0.66 0.884-0.116 0.229-0.351 0.36-0.591 0.36zM29.385 9.903c-0.117 0-0.237-0.028-0.344-0.096-0.317-0.192-0.661-0.327-1.021-0.403s-0.591-0.431-0.516-0.791c0.079-0.36 0.435-0.591 0.792-0.515 0.505 0.108 0.987 0.297 1.432 0.565 0.317 0.189 0.417 0.599 0.227 0.916-0.124 0.208-0.345 0.323-0.569 0.323zM12.252 9.355c-0.339 0-0.628-0.256-0.663-0.6-0.036-0.367 0.231-0.695 0.597-0.731 0.156-0.016 0.316-0.024 0.479-0.024h0.913c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667h-0.912c-0.116 0-0.232 0.005-0.345 0.017-0.023 0.003-0.045 0.004-0.069 0.004zM25.513 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM21.533 9.333h-1.325c-0.369 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.325c0.367 0 0.667 0.299 0.667 0.667s-0.296 0.667-0.667 0.667zM17.557 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 14.667c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667z">
                                    </path>
                                </svg>
                                <div class="px-3">{$LANG.norecordsfound}</div>
                            </div>

                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="Showing-section">
            <div class="Showing-box">
                <div class="Latest-invoices">
                    <p>SHOWING 8 LATEST TICKETS</p>
                </div>
                <div class="View-invoices">
                    <a href="supporttickets.php">VIEW ALL TICKETS<img src="/templates/New-AM/img/View-invoices-arrow.png"></a>
                </div>
            </div>
        </div>
</div>
</div>

<div class="Myticket-section My_project">
    <div class="Myticket-box">
        <div class="Title">
            <h2><img src="/templates/New-AM/img/My-project-icon.png">MY PROJECTS</h2>
        </div>
        <!-- <h3 class="page-header-2">
            <span aria-hidden="true" class="icon icon-support"></span><span
                class="text-lg header-text">{$clientsstats.numactivetickets}
                {$LANG.supportticketsopentickets|replace:'Open Support Tickets':'Tickets'}</span>
        </h3> -->
        <div class="New__ticket">
            <a href="supporttickets.php"><img src="/templates/New-AM/img/New-ticket-icon.png">START NEW PROJECT</a>
        </div>
        <table class="min-w-full divide-y divide-gray-100 dark:divide-gray-900" id="myProjects">
            <thead class="bg-transparent dark:bg-black">
                <tr>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        Title
                    </th>
                    <th class="px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase">
                        Created
                    </th>
                    
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase sm:table-cell">
                        Due Date
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        Status
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        Last Modified
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-center text-gray-500 uppercase lg:table-cell">
                        
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100 dark:divide-gray-900 dark:bg-transparent">
                <tr>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>Website Deisgn & Development - testdomain.com</p></td>
                    <td class="px-6 py-4"><p>8/8/2021</p></td>
                    <td class="px-6 py-4"><p>9/30/2021</p></td>
                    <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label In-progress">IN  PROGRESS</span></p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>9/15/2021</p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">Open<img src="/templates/New-AM/img/open-arrow.png"></a></p></td>                        
                </tr>
                <tr>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>Website Deisgn & Development - testdomain.com</p></td>
                    <td class="px-6 py-4"><p>8/8/2021</p></td>
                    <td class="px-6 py-4"><p>9/30/2021</p></td>
                    <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label Pending">PENDING</span></p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>9/15/2021</p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">Open<img src="/templates/New-AM/img/open-arrow.png"></a></p></td>                        
                </tr>
                <tr>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>Website Deisgn & Development - testdomain.com</p></td>
                    <td class="px-6 py-4"><p>8/8/2021</p></td>
                    <td class="px-6 py-4"><p>9/30/2021</p></td>
                    <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label In-progress">IN  PROGRESS</span></p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>9/15/2021</p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">Open<img src="/templates/New-AM/img/open-arrow.png"></a></p></td>                        
                </tr>
                <tr>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>Website Deisgn & Development - testdomain.com</p></td>
                    <td class="px-6 py-4"><p>8/8/2021</p></td>
                    <td class="px-6 py-4"><p>9/30/2021</p></td>
                    <td class="hidden px-6 py-4 sm:table-cell"><p><span class="label Complete">COMPLETE</span></p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p>9/15/2021</p></td>
                    <td class="hidden px-6 py-4 lg:table-cell"><p><a href="#" class="open-btn">Open<img src="/templates/New-AM/img/open-arrow.png"></a></p></td>                        
                </tr>
            </tbody>
        </table>
        <div class="Showing-section">
            <div class="Showing-box">
                <div class="Latest-invoices">
                    <p>SHOWING 4 LATEST PROJECTS</p>
                </div>
                <div class="View-invoices">
                    <a href="index.php?m=project_management">VIEW ALL PROJECTS<img src="/templates/New-AM/img/View-invoices-arrow.png"></a>
                </div>
            </div>
        </div>
    </div>
</div>




<script>
    jQuery(document).ready(function () {
        jQuery('#table_id').DataTable();
    });
</script>


{foreach $addons_html as $addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}



<!-- <div class="grid grid-cols-1 gap-8 mb-10 xl:grid-cols-2 2xl:grid-cols-3">
    <div class="relative col-span-2 px-10 py-5 bg-white shadow-lg dark:bg-gray-900 rounded-tl-xl rounded-br-xl">
        <h4 class="text-base font-bold tracking-widest uppercase nav-billing">{$LANG.navbilling}</h4>
        <div class="grid grid-cols-1 gap-20 xl:grid-cols-2">
            <div class="flex items-center justify-between mt-5 md:block lg:flex">
                <div class="inline-flex space-x-2 text-sm truncate group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z" />
                    </svg>
                    <span class="mx-3">{$LANG.statsdueinvoicesbalance}</span>
                </div>
                <div><a href="clientarea.php?action=invoices">{$clientsstats.dueinvoicesbalance}</a></div>
            </div>
            <div class="flex items-center justify-between mt-5 md:block lg:flex">
                <div class="inline-flex space-x-2 text-sm truncate group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="flex-shrink-0 w-5 h-5" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    <span class="mx-3">{$LANG.statscreditbalance}</span>
                </div>
                <a href="clientarea.php?action=addfunds">{$clientsstats.creditbalance}</a>
            </div>
        </div>
    </div>

    <div class="relative px-10 py-5 bg-white shadow-lg dark:bg-gray-900 rounded-tl-xl rounded-br-xl">
        <h4 class="text-base font-bold tracking-widest uppercase account-info">{$LANG.accountinfo}</h4>
        <div class="py-5">
            {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
            {$clientsdetails.email}
        </div>
        <div>
            <a class="btn btn-block btn-primary" href="clientarea.php?action=details"
                title="{$LANG.editaccountdetails}">Update</a>
        </div>
    </div>
</div> -->

<!-- <div class="grid grid-cols-1 gap-8 mb-10 xl:grid-cols-2 2xl:grid-cols-3">
    <div class="relative col-span-3 px-10 py-5 bg-white shadow-xl dark:bg-gray-900 rounded-tl-xl rounded-br-xl">
        <h3 class="page-header-2"><span aria-hidden="true" class="icon icon-drawer"></span> <span
                class="text-lg header-text">{$clientsstats.numdueinvoices} {$LANG.invoicesdue}</span></h3>
        <form method="post" action="{$WEB_ROOT}/clientarea.php?action=masspay">

            <table class="min-w-full divide-y divide-gray-100 dark:divide-gray-900" id="myInvoices">
                <thead class="bg-transparent dark:bg-black">
                    <tr>
                        <th></th>
                        <th
                            class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase lg:table-cell">
                            {$LANG.invoicesdatecreated}
                        </th>
                        <th
                            class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase lg:table-cell">
                            {$LANG.invoicesdatedue}
                        </th>
                        <th
                            class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase sm:table-cell">
                            {$LANG.invoicesstatus}
                        </th>
                        <th
                            class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-right text-gray-500 uppercase lg:table-cell">
                            {$LANG.invoicestotal}
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-100 dark:divide-gray-900 dark:bg-transparent">
                    {foreach from=$invoices item=invoice}
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="flex items-center">
                                    {if $masspay = true}
                                        <input type="checkbox" name="invoiceids[]" value="{$invoice.id}"
                                            class="mt-0 mr-2 border invids input" />
                                    {/if}
                                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}"
                                        class="item-title">{$LANG.invoicestitle}{$invoice.invoicenum}</a>
                                </div>
                                <ul class="lg:hidden">
                                    <li class="sm:hidden">
                                        <span
                                            class="pl-0 label label-{$invoice.rawstatus} label-danger">{$invoice.statustext}</span>
                                    </li>
                                    <li>{$LANG.invoicestotal}: {$invoice.total}</li>
                                    <li>{$LANG.invoicesdatecreated}: {$invoice.datecreated}</li>
                                    <li>{$LANG.invoicesdatedue}: {$invoice.datedue}</li>
                                </ul>
                            </td>
                            <td class="hidden px-6 py-4 whitespace-nowrap lg:table-cell">{$invoice.datecreated}</td>
                            <td class="hidden px-6 py-4 whitespace-nowrap lg:table-cell">{$invoice.datedue}</td>
                            <td class="hidden px-6 py-4 whitespace-nowrap sm:table-cell">
                                <span class="label label-{$invoice.rawstatus} label-danger">{$invoice.statustext}</span>
                            </td>
                            <td class="hidden px-6 py-4 text-right whitespace-nowrap lg:table-cell">{$invoice.total}</td>
                        </tr>
                    {foreachelse}
                        <tr>
                            <td colspan="5" class="norecords">
                                <div class="flex items-center">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" width="32"
                                        height="32" viewBox="0 0 32 32">
                                        <title>Folder-Hide</title>
                                        <path
                                            d="M31.333 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM31.333 10.845c-0.368 0-0.667-0.299-0.667-0.667v-0.845c0-0.115-0.005-0.229-0.016-0.344-0.031-0.367 0.243-0.692 0.609-0.72 0.372-0.033 0.691 0.241 0.72 0.609 0.015 0.151 0.020 0.301 0.020 0.455v0.845c0 0.368-0.3 0.667-0.667 0.667zM30.469 7.293c-0.208 0-0.415-0.097-0.544-0.279-0.205-0.291-0.451-0.552-0.725-0.777-0.285-0.233-0.328-0.653-0.095-0.939 0.235-0.285 0.653-0.327 0.94-0.095 0.365 0.301 0.693 0.649 0.967 1.035 0.213 0.3 0.143 0.716-0.155 0.929-0.119 0.085-0.256 0.125-0.388 0.125zM27.377 5.387c-0.033 0-0.068-0.003-0.101-0.008-0.199-0.029-0.401-0.045-0.609-0.045h-0.532c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h0.532c0.276 0 0.547 0.021 0.808 0.061 0.363 0.056 0.613 0.395 0.559 0.759-0.049 0.331-0.333 0.567-0.656 0.567zM23.645 5.333h-1.245c-0.367 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.245c0.367 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM19.913 5.333h-1.244c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.244c0.368 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM16.167 5.333h-0.667c-0.368 0-0.667-0.299-0.667-0.667 0-0.085-0.015-0.235-0.084-0.455-0.111-0.352 0.085-0.725 0.436-0.836s0.725 0.084 0.836 0.436c0.020 0.064 0.036 0.127 0.055 0.188h0.091c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 10.685c-0.368 0-0.667-0.299-0.667-0.667v-1.317c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.317c0 0.368-0.3 0.667-0.667 0.667zM0.667 6.732c-0.368 0-0.667-0.299-0.667-0.667v-0.983c0-0.131 0.004-0.26 0.016-0.389 0.029-0.367 0.341-0.639 0.72-0.611 0.367 0.031 0.64 0.352 0.611 0.72-0.009 0.093-0.013 0.187-0.013 0.28v0.983c0 0.369-0.3 0.667-0.667 0.667zM1.64 3c-0.141 0-0.284-0.045-0.405-0.139-0.292-0.224-0.347-0.643-0.123-0.935 0.312-0.405 0.672-0.76 1.072-1.052 0.299-0.217 0.715-0.152 0.932 0.143 0.217 0.299 0.153 0.716-0.144 0.933s-0.567 0.483-0.803 0.788c-0.132 0.172-0.329 0.261-0.529 0.261zM13.951 2.489c-0.165 0-0.329-0.060-0.459-0.183-0.293-0.277-0.6-0.5-0.912-0.663-0.327-0.169-0.452-0.572-0.283-0.899 0.171-0.327 0.571-0.453 0.899-0.284 0.423 0.22 0.832 0.515 1.215 0.879 0.268 0.252 0.279 0.676 0.025 0.943-0.131 0.136-0.307 0.207-0.485 0.207zM10.319 1.333h-1.319c-0.368 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.297 0.667-0.665 0.667zM6.365 1.333h-1.316c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.668 0.667zM0.667 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM6 32h-0.667c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h0.667c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM25.888 32h-1.325c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM21.911 32h-1.327c-0.367 0-0.667-0.3-0.667-0.667s0.3-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.299 0.667-0.667 0.667zM17.932 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM13.953 32h-1.324c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.668 0.667zM9.976 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM4.695 32c-0.44 0-0.823-0.048-1.192-0.14-0.357-0.088-0.573-0.453-0.483-0.808 0.091-0.359 0.453-0.573 0.809-0.483 0.395 0.1 0.867 0.109 1.107 0.092 0.387-0.007 0.685 0.253 0.711 0.62s-0.252 0.687-0.62 0.711c-0.109 0.004-0.221 0.008-0.332 0.008zM28.521 31.819c-0.284 0-0.547-0.184-0.636-0.471-0.112-0.351 0.084-0.725 0.437-0.835 0.349-0.111 0.68-0.277 0.977-0.499 0.299-0.219 0.713-0.156 0.931 0.14 0.219 0.296 0.156 0.713-0.139 0.932-0.417 0.307-0.881 0.543-1.373 0.696-0.065 0.027-0.133 0.036-0.197 0.036zM7.371 30.963c-0.181 0-0.361-0.073-0.493-0.217-0.248-0.272-0.228-0.693 0.044-0.943 0.273-0.249 0.501-0.539 0.677-0.861s0.581-0.443 0.904-0.268c0.324 0.176 0.444 0.581 0.268 0.904-0.248 0.456-0.567 0.863-0.951 1.213-0.127 0.115-0.289 0.172-0.449 0.172zM1.492 30.451c-0.2 0-0.397-0.088-0.528-0.26-0.317-0.412-0.561-0.869-0.725-1.361-0.116-0.351 0.073-0.727 0.423-0.843 0.349-0.115 0.727 0.073 0.843 0.421s0.289 0.673 0.516 0.969c0.224 0.292 0.171 0.709-0.121 0.933-0.121 0.096-0.265 0.14-0.407 0.14zM31.184 29.084c-0.061 0-0.121-0.009-0.184-0.027-0.355-0.1-0.56-0.469-0.459-0.823 0.081-0.292 0.123-0.593 0.123-0.901v-0.228c0-0.368 0.3-0.667 0.667-0.667 0.368 0 0.667 0.299 0.667 0.667v0.228c0 0.429-0.057 0.855-0.175 1.264-0.080 0.293-0.349 0.487-0.639 0.487zM8.667 27.353c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.3 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM0.667 26.657c-0.368 0-0.667-0.301-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.333 25.12c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM8.667 23.375c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.371-0.3 0.667-0.667 0.667zM0.667 22.681c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 21.14c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v1.325c0 0.371-0.3 0.667-0.667 0.667zM8.667 19.397c-0.368 0-0.667-0.299-0.667-0.667v-1.324c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.324c0 0.368-0.3 0.667-0.667 0.667zM0.667 18.703c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 17.164c-0.368 0-0.667-0.3-0.667-0.667v-1.325c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.325c0 0.367-0.3 0.667-0.667 0.667zM8.667 15.419c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.331 13.187c-0.359 0-0.653-0.283-0.667-0.64-0.013-0.369-0.087-0.731-0.221-1.076-0.135-0.343 0.036-0.729 0.38-0.863 0.341-0.132 0.729 0.037 0.863 0.381 0.189 0.484 0.292 0.992 0.311 1.509 0.013 0.368-0.276 0.677-0.641 0.691-0.008-0.003-0.016-0.003-0.024-0.003zM9.107 11.513c-0.103 0-0.207-0.024-0.305-0.075-0.329-0.168-0.457-0.571-0.287-0.897 0.236-0.459 0.545-0.873 0.919-1.233 0.263-0.255 0.687-0.248 0.943 0.019 0.255 0.265 0.247 0.687-0.019 0.943-0.269 0.257-0.491 0.556-0.66 0.884-0.116 0.229-0.351 0.36-0.591 0.36zM29.385 9.903c-0.117 0-0.237-0.028-0.344-0.096-0.317-0.192-0.661-0.327-1.021-0.403s-0.591-0.431-0.516-0.791c0.079-0.36 0.435-0.591 0.792-0.515 0.505 0.108 0.987 0.297 1.432 0.565 0.317 0.189 0.417 0.599 0.227 0.916-0.124 0.208-0.345 0.323-0.569 0.323zM12.252 9.355c-0.339 0-0.628-0.256-0.663-0.6-0.036-0.367 0.231-0.695 0.597-0.731 0.156-0.016 0.316-0.024 0.479-0.024h0.913c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667h-0.912c-0.116 0-0.232 0.005-0.345 0.017-0.023 0.003-0.045 0.004-0.069 0.004zM25.513 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM21.533 9.333h-1.325c-0.369 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.325c0.367 0 0.667 0.299 0.667 0.667s-0.296 0.667-0.667 0.667zM17.557 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 14.667c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667z">
                                        </path>
                                    </svg>
                                    <div class="px-3">{$LANG.norecordsfound}</div>
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
                {if $masspay = true && $clientsstats.numdueinvoices neq 0}
                    <tfoot>
                        <tr>
                            <td colspan="5" class="px-6 py-4 whitespace-nowrap">
                                <input type="submit" name="masspayselected" value="{$LANG.masspayselected}"
                                    class="btn btn-primary btn-sm" />
                                <a class="btn btn-primary btn-sm"
                                    href="{$WEB_ROOT}/clientarea.php?action=masspay&amp;all=true">{$LANG.masspayall}</a>
                            </td>
                        </tr>
                    </tfoot>
                {/if}
            </table>
        </form>
    </div>
</div> -->


<!-- <div class="grid grid-cols-1 gap-8 mb-10 xl:grid-cols-2 2xl:grid-cols-3">
    <div class="relative col-span-3 px-10 py-5 bg-white shadow-xl dark:bg-gray-900 rounded-tl-xl rounded-br-xl">
        <h3 class="page-header-2"><span aria-hidden="true" class="icon icon-support"></span><span
                class="text-lg header-text">{$clientsstats.numactivetickets}
                {$LANG.supportticketsopentickets|replace:'Open Support Tickets':'Tickets'}</span></h3>
        <table class="min-w-full divide-y divide-gray-100 dark:divide-gray-900" id="mySupport">
            <thead class="bg-transparent dark:bg-black">
                <tr>
                    <th class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase">
                        {$LANG.supportticketssubject}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase lg:table-cell">
                        {$LANG.supportticketsdepartment}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase sm:table-cell">
                        {$LANG.supportticketsstatus}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase lg:table-cell">
                        {$LANG.supportticketsticketurgency}
                    </th>
                    <th
                        class="hidden px-6 py-3 text-xs font-medium tracking-wider text-left text-right text-gray-500 uppercase lg:table-cell">
                        {$LANG.supportticketsticketlastupdated}
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100 dark:divide-gray-900 dark:bg-transparent">
                {foreach from=$tickets item=ticket}
                    {assign var="label" value="text-primary-600"}
                    {if $ticket.status|strstr:"779500"}{assign var="label" value="text-green-600"}
                    {elseif $ticket.status|strstr:"000000"}{assign var="label" value="text-black dark:text-white"}
                    {elseif $ticket.status|strstr:"888888"}{assign var="label" value="text-gray-600"}
                    {elseif $ticket.status|strstr:"ff6600"}{assign var="label" value="text-orange-600"}
                    {elseif $ticket.status|strstr:"224488"}{assign var="label" value="text-blue-600"}
                    {elseif $ticket.status|strstr:"cc0000"}{assign var="label" value="text-red-600"}
                    {/if}
                    <tr>
                        <td class="px-6 py-4">
                            <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{$ticket.subject}</a>
                            <ul class="lg:hidden">
                                <li class="sm:hidden">
                                    <span class="pl-0 label {$label}">{$ticket.status|strip_tags:false}</span>
                                </li>
                                <li>{$LANG.supportticketsticketlastupdated}: {$ticket.lastreply}</li>
                                <li>{$LANG.supportticketsdepartment}: {$ticket.department}</li>
                                <li>{$LANG.supportticketsticketurgency}: {$ticket.urgency}</li>
                            </ul>
                        </td>
                        <td class="hidden px-6 py-4 whitespace-nowrap lg:table-cell">{$ticket.department}</td>
                        <td class="hidden px-6 py-4 sm:table-cell whitespace-nowrap">
                            <span class="label {$label} {$ticket.status|strip_tags:false} {$ticket.status|strip_tags:false}">{$ticket.status|strip_tags:false}</span>
                        </td>
                        <td class="hidden px-6 py-4 whitespace-nowrap lg:table-cell">{$ticket.urgency}</td>
                        <td class="hidden px-6 py-4 text-right whitespace-nowrap lg:table-cell">{$ticket.lastreply}</td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="5" class="norecords">
                            <div class="flex items-center">
                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" width="32" height="32"
                                    viewBox="0 0 32 32">
                                    <title>Folder-Hide</title>
                                    <path
                                        d="M31.333 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM31.333 10.845c-0.368 0-0.667-0.299-0.667-0.667v-0.845c0-0.115-0.005-0.229-0.016-0.344-0.031-0.367 0.243-0.692 0.609-0.72 0.372-0.033 0.691 0.241 0.72 0.609 0.015 0.151 0.020 0.301 0.020 0.455v0.845c0 0.368-0.3 0.667-0.667 0.667zM30.469 7.293c-0.208 0-0.415-0.097-0.544-0.279-0.205-0.291-0.451-0.552-0.725-0.777-0.285-0.233-0.328-0.653-0.095-0.939 0.235-0.285 0.653-0.327 0.94-0.095 0.365 0.301 0.693 0.649 0.967 1.035 0.213 0.3 0.143 0.716-0.155 0.929-0.119 0.085-0.256 0.125-0.388 0.125zM27.377 5.387c-0.033 0-0.068-0.003-0.101-0.008-0.199-0.029-0.401-0.045-0.609-0.045h-0.532c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h0.532c0.276 0 0.547 0.021 0.808 0.061 0.363 0.056 0.613 0.395 0.559 0.759-0.049 0.331-0.333 0.567-0.656 0.567zM23.645 5.333h-1.245c-0.367 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.245c0.367 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM19.913 5.333h-1.244c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.244c0.368 0 0.667 0.299 0.667 0.667s-0.299 0.667-0.667 0.667zM16.167 5.333h-0.667c-0.368 0-0.667-0.299-0.667-0.667 0-0.085-0.015-0.235-0.084-0.455-0.111-0.352 0.085-0.725 0.436-0.836s0.725 0.084 0.836 0.436c0.020 0.064 0.036 0.127 0.055 0.188h0.091c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 10.685c-0.368 0-0.667-0.299-0.667-0.667v-1.317c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.317c0 0.368-0.3 0.667-0.667 0.667zM0.667 6.732c-0.368 0-0.667-0.299-0.667-0.667v-0.983c0-0.131 0.004-0.26 0.016-0.389 0.029-0.367 0.341-0.639 0.72-0.611 0.367 0.031 0.64 0.352 0.611 0.72-0.009 0.093-0.013 0.187-0.013 0.28v0.983c0 0.369-0.3 0.667-0.667 0.667zM1.64 3c-0.141 0-0.284-0.045-0.405-0.139-0.292-0.224-0.347-0.643-0.123-0.935 0.312-0.405 0.672-0.76 1.072-1.052 0.299-0.217 0.715-0.152 0.932 0.143 0.217 0.299 0.153 0.716-0.144 0.933s-0.567 0.483-0.803 0.788c-0.132 0.172-0.329 0.261-0.529 0.261zM13.951 2.489c-0.165 0-0.329-0.060-0.459-0.183-0.293-0.277-0.6-0.5-0.912-0.663-0.327-0.169-0.452-0.572-0.283-0.899 0.171-0.327 0.571-0.453 0.899-0.284 0.423 0.22 0.832 0.515 1.215 0.879 0.268 0.252 0.279 0.676 0.025 0.943-0.131 0.136-0.307 0.207-0.485 0.207zM10.319 1.333h-1.319c-0.368 0-0.667-0.299-0.667-0.667s0.3-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.297 0.667-0.665 0.667zM6.365 1.333h-1.316c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.317c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.668 0.667zM0.667 14c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667zM6 32h-0.667c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h0.667c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM25.888 32h-1.325c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.367 0 0.667 0.3 0.667 0.667s-0.3 0.667-0.667 0.667zM21.911 32h-1.327c-0.367 0-0.667-0.3-0.667-0.667s0.3-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.299 0.667-0.667 0.667zM17.932 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM13.953 32h-1.324c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.325c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.668 0.667zM9.976 32h-1.327c-0.368 0-0.667-0.3-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.368 0 0.667 0.3 0.667 0.667s-0.297 0.667-0.667 0.667zM4.695 32c-0.44 0-0.823-0.048-1.192-0.14-0.357-0.088-0.573-0.453-0.483-0.808 0.091-0.359 0.453-0.573 0.809-0.483 0.395 0.1 0.867 0.109 1.107 0.092 0.387-0.007 0.685 0.253 0.711 0.62s-0.252 0.687-0.62 0.711c-0.109 0.004-0.221 0.008-0.332 0.008zM28.521 31.819c-0.284 0-0.547-0.184-0.636-0.471-0.112-0.351 0.084-0.725 0.437-0.835 0.349-0.111 0.68-0.277 0.977-0.499 0.299-0.219 0.713-0.156 0.931 0.14 0.219 0.296 0.156 0.713-0.139 0.932-0.417 0.307-0.881 0.543-1.373 0.696-0.065 0.027-0.133 0.036-0.197 0.036zM7.371 30.963c-0.181 0-0.361-0.073-0.493-0.217-0.248-0.272-0.228-0.693 0.044-0.943 0.273-0.249 0.501-0.539 0.677-0.861s0.581-0.443 0.904-0.268c0.324 0.176 0.444 0.581 0.268 0.904-0.248 0.456-0.567 0.863-0.951 1.213-0.127 0.115-0.289 0.172-0.449 0.172zM1.492 30.451c-0.2 0-0.397-0.088-0.528-0.26-0.317-0.412-0.561-0.869-0.725-1.361-0.116-0.351 0.073-0.727 0.423-0.843 0.349-0.115 0.727 0.073 0.843 0.421s0.289 0.673 0.516 0.969c0.224 0.292 0.171 0.709-0.121 0.933-0.121 0.096-0.265 0.14-0.407 0.14zM31.184 29.084c-0.061 0-0.121-0.009-0.184-0.027-0.355-0.1-0.56-0.469-0.459-0.823 0.081-0.292 0.123-0.593 0.123-0.901v-0.228c0-0.368 0.3-0.667 0.667-0.667 0.368 0 0.667 0.299 0.667 0.667v0.228c0 0.429-0.057 0.855-0.175 1.264-0.080 0.293-0.349 0.487-0.639 0.487zM8.667 27.353c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.3 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM0.667 26.657c-0.368 0-0.667-0.301-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.333 25.12c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM8.667 23.375c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.371-0.3 0.667-0.667 0.667zM0.667 22.681c-0.368 0-0.667-0.299-0.667-0.667v-1.327c0-0.365 0.299-0.667 0.667-0.667s0.667 0.301 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 21.14c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667 0.367 0 0.667 0.299 0.667 0.667v1.325c0 0.371-0.3 0.667-0.667 0.667zM8.667 19.397c-0.368 0-0.667-0.299-0.667-0.667v-1.324c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.324c0 0.368-0.3 0.667-0.667 0.667zM0.667 18.703c-0.368 0-0.667-0.301-0.667-0.667v-1.327c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.327c0 0.368-0.3 0.667-0.667 0.667zM31.333 17.164c-0.368 0-0.667-0.3-0.667-0.667v-1.325c0-0.365 0.299-0.667 0.667-0.667 0.367 0 0.667 0.301 0.667 0.667v1.325c0 0.367-0.3 0.667-0.667 0.667zM8.667 15.419c-0.368 0-0.667-0.299-0.667-0.667v-1.325c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v1.325c0 0.369-0.3 0.667-0.667 0.667zM31.331 13.187c-0.359 0-0.653-0.283-0.667-0.64-0.013-0.369-0.087-0.731-0.221-1.076-0.135-0.343 0.036-0.729 0.38-0.863 0.341-0.132 0.729 0.037 0.863 0.381 0.189 0.484 0.292 0.992 0.311 1.509 0.013 0.368-0.276 0.677-0.641 0.691-0.008-0.003-0.016-0.003-0.024-0.003zM9.107 11.513c-0.103 0-0.207-0.024-0.305-0.075-0.329-0.168-0.457-0.571-0.287-0.897 0.236-0.459 0.545-0.873 0.919-1.233 0.263-0.255 0.687-0.248 0.943 0.019 0.255 0.265 0.247 0.687-0.019 0.943-0.269 0.257-0.491 0.556-0.66 0.884-0.116 0.229-0.351 0.36-0.591 0.36zM29.385 9.903c-0.117 0-0.237-0.028-0.344-0.096-0.317-0.192-0.661-0.327-1.021-0.403s-0.591-0.431-0.516-0.791c0.079-0.36 0.435-0.591 0.792-0.515 0.505 0.108 0.987 0.297 1.432 0.565 0.317 0.189 0.417 0.599 0.227 0.916-0.124 0.208-0.345 0.323-0.569 0.323zM12.252 9.355c-0.339 0-0.628-0.256-0.663-0.6-0.036-0.367 0.231-0.695 0.597-0.731 0.156-0.016 0.316-0.024 0.479-0.024h0.913c0.368 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667h-0.912c-0.116 0-0.232 0.005-0.345 0.017-0.023 0.003-0.045 0.004-0.069 0.004zM25.513 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM21.533 9.333h-1.325c-0.369 0-0.667-0.299-0.667-0.667s0.297-0.667 0.667-0.667h1.325c0.367 0 0.667 0.299 0.667 0.667s-0.296 0.667-0.667 0.667zM17.557 9.333h-1.327c-0.368 0-0.667-0.299-0.667-0.667s0.299-0.667 0.667-0.667h1.327c0.367 0 0.667 0.299 0.667 0.667s-0.3 0.667-0.667 0.667zM0.667 14.667c-0.368 0-0.667-0.299-0.667-0.667v-0.667c0-0.368 0.299-0.667 0.667-0.667s0.667 0.299 0.667 0.667v0.667c0 0.368-0.3 0.667-0.667 0.667z">
                                    </path>
                                </svg>
                                <div class="px-3">{$LANG.norecordsfound}</div>
                            </div>

                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div> -->