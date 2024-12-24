<style>
	@media (min-width: 1024px) {
		.about {
			min-height: 100vh;
			display: flex;
			align-items: center;
		}
	}
</style>

<template>
	<div>
		<h1>Usuários</h1>

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>E-mail</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="u in usuarios">
					<td>{{ u.id }}</td>
					<td>{{ u.nome }}</td>
					<td>{{ u.email }}</td>
				</tr>
			</tbody>
		</table>
	</div>
</template>

<script>
	import { ref, onMounted } from 'vue';

	export default {
		setup() {
			const usuarios = ref([]);

			const fetchUsuarios = async () => {
				try {
					const response =  await fetch('http://localhost:8000');
					const data = await response.json();
					usuarios.value = data;
				} catch (error) {
					console.error('Erro ao buscar usuários:', error);
				}
			};

			onMounted(fetchUsuarios);

			return {
				usuarios
			};
		}
	};
</script>