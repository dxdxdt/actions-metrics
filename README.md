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
Updated: 2026-05-23T20:08:59.378161+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.157 | 4681 |
| us-east-2 | 0.119 | 1607 |
| us-gov-east-1 | 0.121 | 1704 |
| us-gov-west-1 | 0.202 | 195 |
| us-west-1 | 0.152 | 3591 |
| us-west-2 | 0.207 | 159 |

