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
Updated: 2026-06-19T15:57:14.584811+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.751 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.735 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.622 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.143 | 4773 |
| us-east-2 | 0.138 | 1635 |
| us-gov-east-1 | 0.139 | 1714 |
| us-gov-west-1 | 0.224 | 198 |
| us-west-1 | 0.166 | 3680 |
| us-west-2 | 0.226 | 163 |

