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
Updated: 2026-02-28T01:13:24.788454+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.971 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.719 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.886 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.564 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.866 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.598 |  |
| us-east-1 | 0.161 | 4195 |
| us-east-2 | 0.152 | 1382 |
| us-gov-east-1 | 0.158 | 1518 |
| us-gov-west-1 | 0.206 | 162 |
| us-west-1 | 0.158 | 3138 |
| us-west-2 | 0.206 | 133 |

