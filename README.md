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
Updated: 2026-02-23T20:37:17.117831+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.848 |  |
| ca-central-1 | 0.251 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.729 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.901 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.199 | 4172 |
| us-east-2 | 0.179 | 1372 |
| us-gov-east-1 | 0.192 | 1502 |
| us-gov-west-1 | 0.163 | 160 |
| us-west-1 | 0.124 | 3108 |
| us-west-2 | 0.164 | 130 |

