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
Updated: 2026-09-25T01:03:47.394017+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.741 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.929 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.967 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.933 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.096 | 18 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.397 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.301 |  |
| eu-west-2 | 0.340 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.547 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.478 |  |
| us-east-1 | 0.044 | 5121 |
| us-east-2 | 0.089 | 1686 |
| us-gov-east-1 | 0.087 | 1926 |
| us-gov-west-1 | 0.311 | 235 |
| us-west-1 | 0.257 | 4136 |
| us-west-2 | 0.313 | 192 |

