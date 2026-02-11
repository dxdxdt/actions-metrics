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
Updated: 2026-02-11T14:11:55.237514+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.790 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.721 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.805 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.414 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.438 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.758 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.067 | 4104 |
| us-east-2 | 0.081 | 1331 |
| us-gov-east-1 | 0.079 | 1452 |
| us-gov-west-1 | 0.278 | 143 |
| us-west-1 | 0.257 | 3039 |
| us-west-2 | 0.277 | 125 |

