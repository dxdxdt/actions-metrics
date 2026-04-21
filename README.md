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
Updated: 2026-04-21T11:56:19.259062+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.695 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.992 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.781 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.101 | 4535 |
| us-east-2 | 0.084 | 1523 |
| us-gov-east-1 | 0.091 | 1658 |
| us-gov-west-1 | 0.241 | 194 |
| us-west-1 | 0.194 | 3453 |
| us-west-2 | 0.247 | 156 |

