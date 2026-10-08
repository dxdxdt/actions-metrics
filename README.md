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
Updated: 2026-10-08T06:53:48.454952+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.225 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.181 | 5140 |
| us-east-2 | 0.186 | 1691 |
| us-gov-east-1 | 0.183 | 1935 |
| us-gov-west-1 | 0.174 | 237 |
| us-west-1 | 0.114 | 4161 |
| us-west-2 | 0.173 | 194 |

