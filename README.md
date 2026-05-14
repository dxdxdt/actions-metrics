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
Updated: 2026-05-14T20:24:47.375705+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.872 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.305 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.455 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.466 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.103 | 4638 |
| us-east-2 | 0.119 | 1593 |
| us-gov-east-1 | 0.130 | 1689 |
| us-gov-west-1 | 0.268 | 195 |
| us-west-1 | 0.224 | 3562 |
| us-west-2 | 0.264 | 158 |

