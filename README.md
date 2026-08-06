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
Updated: 2026-08-06T10:31:13.005350+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.604 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.243 | 17 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.203 | 4946 |
| us-east-2 | 0.192 | 1674 |
| us-gov-east-1 | 0.164 | 1805 |
| us-gov-west-1 | 0.174 | 211 |
| us-west-1 | 0.119 | 3889 |
| us-west-2 | 0.173 | 172 |

