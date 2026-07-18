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
Updated: 2026-07-18T04:42:16.518364+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.727 |  |
| ap-southeast-2 | 0.612 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.757 |  |
| ap-southeast-6 | 0.656 |  |
| ap-southeast-7 | 0.830 |  |
| ca-central-1 | 0.253 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.610 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.515 |  |
| eu-west-3 | 0.536 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.683 |  |
| us-east-1 | 0.220 | 4877 |
| us-east-2 | 0.218 | 1657 |
| us-gov-east-1 | 0.189 | 1766 |
| us-gov-west-1 | 0.137 | 203 |
| us-west-1 | 0.081 | 3795 |
| us-west-2 | 0.138 | 166 |

