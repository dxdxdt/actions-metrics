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
Updated: 2026-08-09T19:26:34.245366+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.134 | 18 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.548 |  |
| us-east-1 | 0.103 | 4964 |
| us-east-2 | 0.093 | 1678 |
| us-gov-east-1 | 0.095 | 1812 |
| us-gov-west-1 | 0.264 | 214 |
| us-west-1 | 0.210 | 3914 |
| us-west-2 | 0.267 | 175 |

