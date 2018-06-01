
1. At first, we display Bootstrap's file input field so that the user can select a file.
2. Then, we display a text field where the user can enter the owner's details.
3. Then, we have two buttons. The first one is to store the file hash and the owner's
details in the contract, and the second button is to get information on the file from
the contract. Clicking on the Submit button triggers the submit() method,
whereas clicking on the Get Info button triggers the getInfo() method.
4. Then, we have an alert box to display messages.
5. Finally, we display an ordered list to display the transactions of the contract that
gets mined while the user is on the page.


1. At first, we defined the submit() method. In the submit method, we make sure
that a file is selected and the text field is not empty. Then, we read the content of
the file as an array buffer and pass the array buffer to the sha1() method
exposed by sha1.js to get the hash of content inside the array buffer. Once we
have the hash, we use jQuery to make an AJAX request to the /submit route and
then we display the transaction hash in the alert box.
2. We define the getInfo() method next. It first makes sure that a file is selected.
Then, it generates the hash like the one it generated earlier and makes a request
to the /getInfo endpoint to get information about that file.
3. Finally, we establish a socket.io connection using the io() method exposed by
the socket.io library. Then, we wait for the connect event to the trigger, which
indicates that a connection has been established. After the connection is
established, we listen for messages from the server and display the details about
the transactions to the user.


Note : We aren't storing the file in the Ethereum blockchain because storing files
is very expensive as it requires a lot of gas. For our case, we actually don't
need to store files because nodes in the network will be able to see the file;
therefore, if the users want to keep the file content secret, then they won't
be able to. Our application's purpose is just to prove ownership of a file,
not to store and serve the file like a cloud service.
