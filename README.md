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
Updated: 2026-06-29T17:30:07.896789+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.614 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.840 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.470 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.099 | 4803 |
| us-east-2 | 0.120 | 1646 |
| us-gov-east-1 | 0.124 | 1723 |
| us-gov-west-1 | 0.269 | 199 |
| us-west-1 | 0.213 | 3720 |
| us-west-2 | 0.261 | 163 |

