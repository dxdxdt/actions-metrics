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
Updated: 2026-08-17T23:15:40.363258+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.225 | 18 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.150 | 5014 |
| us-east-2 | 0.176 | 1680 |
| us-gov-east-1 | 0.171 | 1840 |
| us-gov-west-1 | 0.237 | 224 |
| us-west-1 | 0.171 | 3982 |
| us-west-2 | 0.240 | 181 |

