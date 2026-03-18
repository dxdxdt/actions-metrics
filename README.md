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
Updated: 2026-03-18T21:28:31.895162+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.506 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.559 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.543 |  |
| il-central-1 | 0.744 |  |
| me-central-1 | 0.928 |  |
| me-south-1 | 0.897 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.204 | 4306 |
| us-east-2 | 0.200 | 1433 |
| us-gov-east-1 | 0.202 | 1586 |
| us-gov-west-1 | 0.164 | 189 |
| us-west-1 | 0.105 | 3253 |
| us-west-2 | 0.166 | 148 |

