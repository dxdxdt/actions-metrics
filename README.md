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
Updated: 2024-12-08T20:12:44.650895

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.814 |  |
| ap-northeast-1 | 0.626 |  |
| ap-northeast-2 | 0.734 |  |
| ap-south-1 | 0.884 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.768 |  |
| ca-central-1 | 0.171 | 1 |
| eu-central-1 | 0.462 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.477 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.428 |  |
| me-south-1 | 0.812 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.110 | 281 |
| us-east-2 | 0.145 | 79 |
| us-gov-east-1 | 0.152 | 43 |
| us-gov-west-1 | 0.300 |  |
| us-west-1 | 0.243 | 169 |
| us-west-2 | 0.298 |  |

