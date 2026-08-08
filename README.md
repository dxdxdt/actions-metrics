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
Updated: 2026-08-08T09:29:54.121569+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.503 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.801 |  |
| ap-southeast-4 | 0.672 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.700 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.278 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.560 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.905 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.648 |  |
| us-east-1 | 0.205 | 4957 |
| us-east-2 | 0.226 | 1675 |
| us-gov-east-1 | 0.208 | 1809 |
| us-gov-west-1 | 0.160 | 213 |
| us-west-1 | 0.107 | 3898 |
| us-west-2 | 0.161 | 173 |

