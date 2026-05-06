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
Updated: 2026-05-06T12:27:52.564590+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.131 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.632 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.116 | 4603 |
| us-east-2 | 0.101 | 1568 |
| us-gov-east-1 | 0.089 | 1676 |
| us-gov-west-1 | 0.240 | 194 |
| us-west-1 | 0.179 | 3536 |
| us-west-2 | 0.233 | 157 |

