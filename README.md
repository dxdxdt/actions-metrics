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
Updated: 2026-02-21T08:22:17.020763+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.753 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.596 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.792 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.101 | 4157 |
| us-east-2 | 0.094 | 1359 |
| us-gov-east-1 | 0.097 | 1497 |
| us-gov-west-1 | 0.243 | 160 |
| us-west-1 | 0.228 | 3090 |
| us-west-2 | 0.241 | 129 |

