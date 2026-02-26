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
Updated: 2026-02-26T23:23:09.665672+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.742 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.266 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.545 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.891 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.206 | 4191 |
| us-east-2 | 0.199 | 1381 |
| us-gov-east-1 | 0.198 | 1513 |
| us-gov-west-1 | 0.159 | 162 |
| us-west-1 | 0.105 | 3127 |
| us-west-2 | 0.164 | 132 |

