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
Updated: 2026-08-30T02:44:08.412819+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.117 | 18 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.801 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.086 | 5074 |
| us-east-2 | 0.099 | 1684 |
| us-gov-east-1 | 0.081 | 1891 |
| us-gov-west-1 | 0.267 | 228 |
| us-west-1 | 0.206 | 4067 |
| us-west-2 | 0.259 | 189 |

