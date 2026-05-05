# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-05-05T20:55:55.643955+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.812 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.824 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.822 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.988 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.765 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.058 | 4601 |
| us-east-2 | 0.103 | 1567 |
| us-gov-east-1 | 0.101 | 1673 |
| us-gov-west-1 | 0.330 | 194 |
| us-west-1 | 0.281 | 3535 |
| us-west-2 | 0.328 | 157 |

