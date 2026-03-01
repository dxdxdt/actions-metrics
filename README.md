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
Updated: 2026-03-01T06:37:03.437658+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.670 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.534 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.911 |  |
| me-south-1 | 0.878 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.221 | 4201 |
| us-east-2 | 0.183 | 1386 |
| us-gov-east-1 | 0.184 | 1519 |
| us-gov-west-1 | 0.137 | 166 |
| us-west-1 | 0.119 | 3146 |
| us-west-2 | 0.136 | 135 |

