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
Updated: 2026-03-26T06:08:37.351570+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.658 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.499 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.788 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.136 | 4360 |
| us-east-2 | 0.119 | 1456 |
| us-gov-east-1 | 0.118 | 1604 |
| us-gov-west-1 | 0.225 | 190 |
| us-west-1 | 0.175 | 3299 |
| us-west-2 | 0.230 | 151 |

