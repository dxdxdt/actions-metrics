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
Updated: 2026-04-10T23:29:02.293744+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.758 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.745 |  |
| ap-northeast-3 | 0.656 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.808 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.898 |  |
| ap-southeast-7 | 0.977 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.452 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.379 |  |
| il-central-1 | 0.563 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.057 | 4475 |
| us-east-2 | 0.090 | 1491 |
| us-gov-east-1 | 0.091 | 1639 |
| us-gov-west-1 | 0.317 | 192 |
| us-west-1 | 0.264 | 3391 |
| us-west-2 | 0.315 | 155 |

