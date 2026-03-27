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
Updated: 2026-03-27T15:44:21.118565+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.858 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.428 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.769 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.099 | 4371 |
| us-east-2 | 0.112 | 1458 |
| us-gov-east-1 | 0.113 | 1609 |
| us-gov-west-1 | 0.271 | 190 |
| us-west-1 | 0.220 | 3307 |
| us-west-2 | 0.270 | 151 |

