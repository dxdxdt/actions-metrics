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
Updated: 2026-06-30T06:50:50.680929+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.626 |  |
| ap-northeast-3 | 0.546 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.560 |  |
| eu-south-1 | 0.551 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.153 | 4803 |
| us-east-2 | 0.126 | 1647 |
| us-gov-east-1 | 0.125 | 1725 |
| us-gov-west-1 | 0.190 | 199 |
| us-west-1 | 0.133 | 3723 |
| us-west-2 | 0.189 | 163 |

