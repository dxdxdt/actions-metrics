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
Updated: 2026-11-22T04:18:10.691557+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.691 |  |
| ap-east-1 | 0.566 |  |
| ap-east-2 | 0.516 |  |
| ap-northeast-1 | 0.423 |  |
| ap-northeast-2 | 0.500 |  |
| ap-northeast-3 | 0.451 |  |
| ap-south-1 | 0.619 |  |
| ap-south-2 | 0.640 |  |
| ap-southeast-1 | 0.627 |  |
| ap-southeast-2 | 0.564 |  |
| ap-southeast-3 | 0.680 |  |
| ap-southeast-4 | 0.605 |  |
| ap-southeast-5 | 0.637 |  |
| ap-southeast-6 | 0.617 |  |
| ap-southeast-7 | 0.703 |  |
| ca-central-1 | 0.085 | 18 |
| ca-west-1 | 0.159 |  |
| eu-central-1 | 0.326 |  |
| eu-central-2 | 0.326 |  |
| eu-north-1 | 0.364 |  |
| eu-south-1 | 0.341 |  |
| eu-south-2 | 0.333 |  |
| eu-west-1 | 0.250 |  |
| eu-west-2 | 0.274 |  |
| eu-west-3 | 0.304 |  |
| il-central-1 | 0.444 |  |
| me-central-1 | 0.617 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.610 |  |
| mx-central-1 | 0.179 |  |
| sa-east-1 | 0.392 |  |
| us-east-1 | 0.056 | 5194 |
| us-east-2 | 0.063 | 1730 |
| us-gov-east-1 | 0.066 | 1965 |
| us-gov-west-1 | 0.164 | 248 |
| us-west-1 | 0.157 | 4221 |
| us-west-2 | 0.166 | 200 |

