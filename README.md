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
Updated: 2026-10-13T01:03:34.480841+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.741 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.185 | 18 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.652 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.169 | 5144 |
| us-east-2 | 0.140 | 1695 |
| us-gov-east-1 | 0.151 | 1940 |
| us-gov-west-1 | 0.195 | 237 |
| us-west-1 | 0.139 | 4168 |
| us-west-2 | 0.192 | 194 |

