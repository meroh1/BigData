// 1. Actualizar Rol (roles)

db.roles.updateOne(
    { "_id": 1 }, 
    { 
      $set: { "roleName": "Usuario Regular" }, // Cambiar el nombre del rol
      $setOnInsert: { "_id": 1 } // Solo se establece si se inserta el documento
    },
    { upsert: true } // Inserta el documento si no existe
);

  
// 2. Actualizar Usuario (users) Actualizar un usuario y agregar un nuevo número de teléfono.

db.users.updateOne(
    { "_id": 1 }, 
    { 
      $set: { 
        "profile.address": "Nueva Calle 456", // Cambia la dirección
        "updatedAt": new Date() // Actualiza la fecha de modificación
      },
      $addToSet: { 
        "profile.phones": { $each: ["111222333"] } // Agrega un nuevo número de teléfono si no existe
      },
      $setOnInsert: { "_id": 1 } 
    },
    { upsert: true }
  );

// 3. Actualizar Método de Pago (paymentMethods)

db.paymentMethods.updateOne(
    { "_id": 1 }, 
    { 
      $set: { 
        "expirationDate": "01/27", // Actualizar fecha de expiración
        "updatedAt": new Date()
      },
      $setOnInsert: { "_id": 1, "userId": 1 }
    },
    { upsert: true }
  );

  
// 4. Actualizar Suscripción (subscriptions) Extender la suscripción si está activa.

db.subscriptions.updateOne(
    { "_id": 1, "status": "active" }, 
    { 
      $set: { 
        "expiresAt": new Date("2024-12-15T00:00:00Z"), // Extiende la suscripción
        "updatedAt": new Date()
      },
      $setOnInsert: { "_id": 1, "userId": 1, "streamerId": 2 }
    },
    { upsert: true }
);
  
// 5. Actualizar Suscripción Regalada (giftedSubscriptions) Agregar más usuarios a los que se les regala la suscripción.

db.giftedSubscriptions.updateOne(
    { "_id": 1 }, 
    { 
      $addToSet: { 
        "userIds": { $each: [14, 15, 16] } // Agrega más usuarios a la lista
      },
      $set: { 
        "updatedAt": new Date() 
      },
      $setOnInsert: { "_id": 1, "giftedBy": 1 }
    },
    { upsert: true }
);
  
// 6. Actualizar Stream (streams) Cambiar el título del stream.

db.streams.updateOne(
    { "_id": 101 }, 
    { 
      $set: { 
        "title": "Nuevo título de stream", // Cambiar título
        "updatedAt": new Date()
      },
      $setOnInsert: { "_id": 101, "userId": 1 }
    },
    { upsert: true }
  );
  
// 7. Actualizar Visualizadores del Stream (streamViewers) Agregar más visualizadores al stream.

db.streamViewers.updateOne(
    { "_id": 101 }, 
    { 
      $addToSet: { 
        "viewers": { $each: [201, 202, 203] } // Agregar nuevos visualizadores
      },
      $setOnInsert: { "_id": 101, "streamId": 101 }
    },
    { upsert: true }
  );

// 8. Actualizar Mensajes del Chat (chatMessages) Actualizar un mensaje en un chat.

db.chatMessages.updateOne(
    { "_id": 1 }, 
    { 
      $set: { 
        "message": "¡Nuevo mensaje actualizado!", // Actualiza el mensaje
        "isHighlighted": false, // Cambia el estado destacado
        "updatedAt": new Date()
      },
      $setOnInsert: { "_id": 1, "userId": 1, "streamId": 101 }
    },
    { upsert: true }
);
  