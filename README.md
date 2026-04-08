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
Updated: 2026-04-08T18:01:13.027877+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.150 | 16 |
| ca-west-1 | 0.362 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.093 | 4458 |
| us-east-2 | 0.110 | 1489 |
| us-gov-east-1 | 0.119 | 1634 |
| us-gov-west-1 | 0.281 | 192 |
| us-west-1 | 0.238 | 3379 |
| us-west-2 | 0.280 | 154 |

