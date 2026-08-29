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
Updated: 2026-08-29T23:46:27.257183+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.584 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.606 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.893 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.139 | 18 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.093 | 5074 |
| us-east-2 | 0.112 | 1684 |
| us-gov-east-1 | 0.105 | 1890 |
| us-gov-west-1 | 0.263 | 228 |
| us-west-1 | 0.201 | 4067 |
| us-west-2 | 0.255 | 189 |

