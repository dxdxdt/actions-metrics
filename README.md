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
Updated: 2026-03-24T04:11:49.126230+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.529 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.847 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.144 | 4343 |
| us-east-2 | 0.146 | 1449 |
| us-gov-east-1 | 0.138 | 1599 |
| us-gov-west-1 | 0.206 | 190 |
| us-west-1 | 0.157 | 3289 |
| us-west-2 | 0.204 | 151 |

