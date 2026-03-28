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
Updated: 2026-03-28T04:12:54.730790+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.060 |  |
| ap-east-1 | 0.626 |  |
| ap-east-2 | 0.567 |  |
| ap-northeast-1 | 0.448 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.475 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.701 |  |
| ap-southeast-2 | 0.622 |  |
| ap-southeast-3 | 0.755 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.719 |  |
| ap-southeast-6 | 0.651 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.293 | 16 |
| ca-west-1 | 0.165 |  |
| eu-central-1 | 0.589 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.648 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.643 |  |
| eu-west-1 | 0.512 |  |
| eu-west-2 | 0.546 |  |
| eu-west-3 | 0.564 |  |
| il-central-1 | 0.764 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.897 |  |
| mx-central-1 | 0.289 |  |
| sa-east-1 | 0.676 |  |
| us-east-1 | 0.245 | 4373 |
| us-east-2 | 0.223 | 1458 |
| us-gov-east-1 | 0.233 | 1610 |
| us-gov-west-1 | 0.115 | 190 |
| us-west-1 | 0.105 | 3313 |
| us-west-2 | 0.113 | 152 |

