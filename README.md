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
Updated: 2026-04-16T10:10:19.451265+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.752 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.802 |  |
| ap-southeast-3 | 0.964 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.866 |  |
| ap-southeast-7 | 0.983 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.404 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.515 |  |
| us-east-1 | 0.070 | 4511 |
| us-east-2 | 0.083 | 1504 |
| us-gov-east-1 | 0.098 | 1650 |
| us-gov-west-1 | 0.309 | 193 |
| us-west-1 | 0.255 | 3419 |
| us-west-2 | 0.311 | 156 |

