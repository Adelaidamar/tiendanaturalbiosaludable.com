$(document).ready(function() {
    let cartItems = JSON.parse(localStorage.getItem('cart')) || [];

    function saveCart() {
        localStorage.setItem('cart', JSON.stringify(cartItems));
        updateCartCounter();
    }

    function updateCartCounter() {
        const totalItems = cartItems.reduce((total, item) => total + item.quantity, 0);
        $('#cart .badge').text(totalItems);
    }

    // Evento para añadir productos al carrito
    $('.add-to-cart').on('click', function() {
        const product = $(this).data('product').trim();
        const price = parseInt($(this).data('price'));
        const image = $(this).data('image');

        const existingItem = cartItems.find(item => item.product === product);

        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cartItems.push({
                product: product,
                price: price,
                quantity: 1,
                image: image || 'default.jpg'
            });
        }

        saveCart();
        alert('Producto añadido al carrito');
    });

    function updateCartDisplay() {
        const cartList = $('#cart-items');
        const cartTotalDisplay = $('#cart-total');

        cartList.empty();
        let cartTotal = 0;

        cartItems.forEach((item, index) => {
            cartTotal += item.price * item.quantity;

            const listItem = $(`
                <li class="list-group-item d-flex align-items-center justify-content-between">
                    <img src="IMAGENES/${item.image}" alt="${item.product}" width="50" class="me-3 rounded">
                    <div class="flex-grow-1">
                        <strong>${item.product}</strong><br>
                        <small>$${item.price.toLocaleString()} x ${item.quantity}</small>
                    </div>
                    <span class="me-3">$${(item.price * item.quantity).toLocaleString()}</span>
                    <button class="btn btn-danger btn-sm remove-item" data-index="${index}">
                        <i class="fas fa-trash"></i>
                    </button>
                </li>
            `);

            listItem.find('.remove-item').on('click', function() {
                const idx = $(this).data('index');
                cartItems.splice(idx, 1);
                saveCart();
                updateCartDisplay();
            });

            cartList.append(listItem);
        });

        cartTotalDisplay.text(`Total: $${cartTotal.toLocaleString()}`);
        updateCartCounter();
    }

    // Inicializar carrito al cargar página
    updateCartDisplay();

    // Vaciar carrito si tienes botón con id #vaciar-carrito
    $('#vaciar-carrito').on('click', function() {
        cartItems = [];
        saveCart();
        updateCartDisplay();
    });

    // ========== MODAL DE VIDEO ==========
    $('.view-video').on('click', function() {
        const videoUrl = $(this).data('video-url');
        $('#videoIframe').attr('src', videoUrl);
        $('#videoModal').modal('show');
    });

    $('#videoModal').on('hidden.bs.modal', function() {
        $('#videoIframe').attr('src', '');
    });
});
