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
Updated: 2026-02-18T11:33:55.752510+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.822 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.577 |  |
| us-east-1 | 0.108 | 4139 |
| us-east-2 | 0.103 | 1354 |
| us-gov-east-1 | 0.103 | 1488 |
| us-gov-west-1 | 0.222 | 154 |
| us-west-1 | 0.286 | 3073 |
| us-west-2 | 0.221 | 126 |

